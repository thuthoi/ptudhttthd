﻿using CardProcessingWebsite.class_DTO;
using CardProcessingWebsite.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CardProcessingWebsite.master
{
    public partial class agentManagementMerchant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                rbtnGanQuyen.Checked = true;
                loadMerchantListForGanQuyen();
                loadAgentForGanQuyen();
            }
        }

        private void loadAgentForGanQuyen()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/agent/getAgentbyMaster/" + CurrentContext.GetCurUser().UserID.ToString();
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Agent[]>().Result;
                    cboAgentforAdd.DataSource = list;
                    cboAgentforAdd.DataTextField = "AgentName";
                    cboAgentforAdd.DataValueField = "AgentID";
                    cboAgentforAdd.DataBind();
                }
            }
        }

        private void loadMerchantListForGanQuyen()
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getMerchantNotHaveAgent";
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var list = response.Content.ReadAsAsync<Merchant[]>().Result;
                    listMerchant.DataSource = list;
                    listMerchant.DataBind();
                }
            }
        }

        protected void rbtnChuyenQuyen_CheckedChanged(object sender, EventArgs e)
        {
            rbtnGanQuyen.Checked = false;
            pnlChuyenQuyen.Visible = true;
            pnlGanQuyen.Visible = false;

        }

        protected void rbtnGanQuyen_CheckedChanged(object sender, EventArgs e)
        {
            rbtnChuyenQuyen.Checked = false;
            pnlChuyenQuyen.Visible = false;
            pnlGanQuyen.Visible = true;
            loadMerchantListForGanQuyen();
            loadAgentForGanQuyen();
        }


        bool AddAgent(string id)
        {
            Merchant mer = null;
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/getProfileMerchant/" + id;
                var response = c.GetAsync(url).Result;
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var merchant = response.Content.ReadAsAsync<Merchant[]>().Result;
                    mer = merchant[0];
                }
            }
            if (UpdateAgent(mer))
            {
                return true;
            }
            else { return false; }
        }

        private bool UpdateAgent(Merchant mer)
        {
            using (var c = new HttpClient())
            {
                c.DefaultRequestHeaders.Accept.Clear();
                c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                string url = localhost.hostname() + "api/merchant/updateAgentforMerchant";
                var response = c.PutAsJsonAsync(url, new
                {
                    MerchantID = mer.MerchantID,
                    MerchantName = mer.MerchantName,
                    Address = mer.Address,
                    Phone = mer.Phone,
                    Email = mer.Email,
                    Status = true,
                    MerchantTypeID = mer.MerchantTypeID,
                    MerchantRegionID = mer.MerchantRegionID,
                    AgentID = cboAgentforAdd.SelectedItem.Value
                }).Result;
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }
                return false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string id = null;
            foreach (var item in listMerchant.Items)
            {
                CheckBox chkbox = item.FindControl("chkPick") as CheckBox;
                if (chkbox.Checked == true)
                {
                    id = string.Empty;
                    id = chkbox.Attributes["Key"].ToString();
                    AddAgent(id);
                }
            }
            loadAgentForGanQuyen();
            loadMerchantListForGanQuyen();
        }
    }
}