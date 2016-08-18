using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNETDevMedia
{
    public partial class pObjectDS01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ODS01.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FVPessoa.ChangeMode(FormViewMode.Edit);
            FVPessoa.DataBind();
        }

        protected void FVPessoa_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            gvPessoa.DataBind();
        }

        protected void FVPessoa_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            gvPessoa.DataBind();
        }
    }
}