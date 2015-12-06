﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Output;

public partial class View_Output_Browse : System.Web.UI.Page
{
    DateSelector dateSelector = null;
    /// <summary>
    /// 过滤器选项存储器
    /// </summary>
    Dictionary<string, int> filter = new Dictionary<string, int>();

    protected void Page_Load(object sender, EventArgs e)
    {
        string reportTable = ReportTableList.SelectedValue;

        if (reportTable == "") {
            reportTable = DataProvider.ReportTables.First().Key;
        }

        Tuple<int, int> range = Output.DataProvider.dateRange(reportTable, DataProvider.ReportDateFields[reportTable]);
        dateSelector = new DateSelector(range.Item1, range.Item2);
        dateSelector.setYearSelector(yearSelector, "-年-");
        dateSelector.setMonthSelector(monthSelector, "-月-");
        dateSelector.setDaySelector(daySelector, "-日-");

        if (!IsPostBack)
        {
            dateSelector.show();
        }

        try
        {
            reportTypeLabel.Text = DataProvider.ReportTypeFields[reportTable].ToString();
            ReportTypeList.Visible = true;
        }
        catch (KeyNotFoundException) {
            ReportTypeList.Visible = false;
        }

        ProductTypeLabel.Text = ((int)Param.ReportParam.Type.PRODUCT).ToString();
        ProductFlagLabel.Text = DataProvider.ReportProductFlags[reportTable].ToString();

        CityTypeLabel.Text = ((int)Param.ReportParam.Type.CITY).ToString();
        auditNormalLabel.Text = ((int)Param.ReportStatus.NORMAL).ToString();
    }

    protected void yearSelector_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateSelector.yearChanged(sender, e);
    }

    protected void monthSelector_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateSelector.monthChanged(sender, e);
    }

    protected void clearFilter() {
        filter.Clear();
        yearSelector.SelectedIndex = 0;
        monthSelector.SelectedIndex = 0;
        daySelector.SelectedIndex = 0;
        CityList.SelectedIndex = 0;
        ProductList.SelectedIndex = 0;
        ReportTableList.SelectedIndex = 0;
    }

    protected void ReportTable_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateSelector.show();

        if (DataProvider.ReportDateFields[ReportTableList.SelectedValue] == "month")
        {
            daySelector.Visible = false;
        }
        else {
            daySelector.Visible = true;
        }

        contentMultiView.ActiveViewIndex = ReportTableList.SelectedIndex;

        //将筛选下拉框重置，防止上一次的筛选选项遗留
        //clearFilter();
    }

    protected void DropDownList_DataBinding(object sender, EventArgs e)
    {
        DropDownList list = sender as DropDownList;
        // 在数据绑定之前存储过滤器
        filter[list.ID] = list.SelectedIndex;
    }

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        DropDownList list = sender as DropDownList;
        int index = 0;

        try
        {
            index = filter[list.ID];
        }
        catch (KeyNotFoundException) {
            // ignore
        }

        string name = "全部";

        switch (list.ID) {
            case "CityList":
                name = "--地市--";
                break;
            case "ProductList":
                name = "--产品--";
                break;
            case "ReportTypeList":
                name = "--类型--";
                break;
        }

        list.Items.Insert(0, new ListItem(name, "0"));

        if (index < 0 || index > list.Items.Count - 1)
        {
            index = 0;
        }

        // 还原存储的过滤器
        list.SelectedIndex = index;
    }

}