﻿using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ProductGroups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ProductGroup> productGroups;
            using (var servicesWrapper = new ServicesWrapper())
            {
                switch (servicesWrapper.Services.ReadAllProductGroups(out productGroups))
                {
                    case MethodStatus.Success:
                        grid.DataSource = productGroups;
                        grid.DataBind();
                        lblMessage.Text = String.Format("{0} matching product groups", productGroups.Count);
                        break;
                    case MethodStatus.FatalError:
                        lblMessage.Text = "Fatal error!";
                        break;
                }
            }
        }

    }
}