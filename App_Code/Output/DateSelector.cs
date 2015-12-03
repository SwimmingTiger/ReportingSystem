using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Output
{
    /// <summary>
    /// 日期选择器
    /// </summary>
    public class DateSelector
    {
        protected int yearStart;
        protected int yearEnd;

        protected DropDownList yearSelector = null;
        protected DropDownList monthSelector = null;
        protected DropDownList daySelector = null;

        protected string yearShowAll = null;
        protected string monthShowAll = null;
        protected string dayShowAll = null;

        /// <summary>
        /// 构造日期选择器
        /// </summary>
        /// <param name="yearStart">起始年份</param>
        /// <param name="yearEnd">结束年份</param>
        public DateSelector(int yearStart, int yearEnd)
        {
            this.yearStart = yearStart;
            this.yearEnd = yearEnd;
        }

        /// <summary>
        /// 设置年份选择器
        /// </summary>
        /// <param name="selector">选择器控件</param>
        public void setYearSelector(DropDownList selector, string showAll = null) {
            yearSelector = selector;
            yearShowAll = showAll;
        }

        /// <summary>
        /// 设置月份选择器
        /// </summary>
        /// <param name="selector">选择器控件</param>
        public void setMonthSelector(DropDownList selector, string showAll = null)
        {
            monthSelector = selector;
            monthShowAll = showAll;
        }


        /// <summary>
        /// 设置日子选择器
        /// </summary>
        /// <param name="selector">选择器控件</param>
        public void setDaySelector(DropDownList selector, string showAll = null)
        {
            daySelector = selector;
            dayShowAll = showAll;
        }

        /// <summary>
        /// 显示控件
        /// </summary>
        public void show() {
            if (monthSelector != null && daySelector != null) {
                monthSelector.AutoPostBack = true;

                if (yearSelector != null)
                {
                    yearSelector.AutoPostBack = true;
                }
            }

            setYearItems();
            setMonthItems();
            setDayItems(int.Parse(monthSelector.SelectedValue));
        }

        /// <summary>
        /// 年份改变事件
        /// </summary>
        public void yearChanged(object sender, EventArgs e)
        {
            setDayItems(int.Parse(monthSelector.SelectedValue));
        }

        /// <summary>
        /// 月份改变事件
        /// </summary>
        public void monthChanged(object sender, EventArgs e)
        {
            setDayItems(int.Parse(monthSelector.SelectedValue)); 
        }

        protected void setYearItems() {
            int index = yearSelector.SelectedIndex;
            yearSelector.Items.Clear();

            if (yearShowAll != null) {
                yearSelector.Items.Add(new ListItem(yearShowAll, "0"));
            }

            for (int year=yearStart; year<=yearEnd; year++) {
                yearSelector.Items.Add(new ListItem(year.ToString() + "年", year.ToString()));
            }

            if (yearSelector.Items.Count < 1)
            {
                yearSelector.Visible = false;
            }
            else {
                yearSelector.Visible = true;
            }

            if (index < 0 || index > yearSelector.Items.Count - 1)
            {
                index = 0;
            }

            yearSelector.SelectedIndex = index;
        }

        protected void setMonthItems()
        {
            int index = monthSelector.SelectedIndex;
            monthSelector.Items.Clear();

            if (monthShowAll != null)
            {
                monthSelector.Items.Add(new ListItem(monthShowAll, "0"));
            }

            for (int month = 1; month <= 12; month++)
            {
                monthSelector.Items.Add(new ListItem(month.ToString() + "月", month.ToString()));
            }

            if (index < 0 || index > monthSelector.Items.Count - 1)
            {
                index = 0;
            }

            monthSelector.SelectedIndex = index;
        }

        protected void setDayItems(int month)
        {
            int index = daySelector.SelectedIndex;
            bool isLeapYear = false;

            if (yearSelector == null || yearSelector.Items.Count < 1)
            {
                isLeapYear = true;
            }
            else
            {
                // 检查选中年份是否为闰年（当用户选中“全部”项时，亦认为是闰年）
                isLeapYear = checkLeapYear(int.Parse(yearSelector.SelectedValue));
            }

            daySelector.Items.Clear();

            if (dayShowAll != null)
            {
                daySelector.Items.Add(new ListItem(dayShowAll, "0"));
            }

            int monthDays = getMonthDays(month, isLeapYear);

            for (int day = 1; day <= monthDays; day++)
            {
                daySelector.Items.Add(new ListItem(day.ToString() + "日", day.ToString()));
            }

            if (index < 0 || index > daySelector.Items.Count - 1)
            {
                index = 0;
            }

            daySelector.SelectedIndex = index;
        }

        /// <summary>
        /// 返回月份包含的日期，若月份为0，则返回31.
        /// </summary>
        /// <param name="month">月份</param>
        /// <param name="isLeapYear">是否为闰年</param>
        /// <returns></returns>
        protected int getMonthDays(int month, bool isLeapYear) {
            int[] monthDays = {31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

            int days = monthDays[month];

            if (isLeapYear && month == 2) {
                days++;
            }

            return days;
        }

        protected bool checkLeapYear(int year) {
            bool isLeapYear = false;

            if (year % 4 == 0) {
                if (year % 100 == 0)
                {
                    if (year % 400 == 0)
                    {
                        isLeapYear = true;
                    }
                }
                else {
                    isLeapYear = true;
                }
            }

            return isLeapYear;
        }
    }
}