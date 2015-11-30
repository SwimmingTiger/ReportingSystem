using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Output;

public partial class View_Output_Browse : System.Web.UI.Page
{
    DateSelector dateSelector = new DateSelector(1900, 2200);

    protected void Page_Load(object sender, EventArgs e)
    {
        dateSelector.setYearSelector(yearSelector);
        dateSelector.setMonthSelector(monthSelector);
        dateSelector.setDaySelector(daySelector);

        if (!IsPostBack)
        {
            dateSelector.show();
        }
    }

    protected void yearSelector_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateSelector.yearChanged(sender, e);
    }

    protected void monthSelector_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateSelector.monthChanged(sender, e);
    }
}