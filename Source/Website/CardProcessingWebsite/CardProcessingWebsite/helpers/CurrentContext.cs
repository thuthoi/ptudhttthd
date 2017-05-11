using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CardProcessingWebsite.class_DTO;
using System.Net.Http.Headers;
using System.Net.Http;

namespace CardProcessingWebsite.helpers
{
    public class CurrentContext
    {
        public static bool IsLogged()
        {
            if ((int)HttpContext.Current.Session["IsLogin"] == 1)
            {
                return true;
            }
            if (HttpContext.Current.Request.Cookies["Username"] != null)
            {
                string username = HttpContext.Current.Request.Cookies["Username"].Value;
                using (var c = new HttpClient())
                {
                    c.DefaultRequestHeaders.Accept.Clear();
                    c.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    string url = localhost.hostname() + "api/account/login_remember";
                    var response = c.PostAsJsonAsync(url, new
                    {
                        UserID = "",
                        Username = username,
                        Password = "",
                        OldPassword = "",
                        Role = ""
                    }).Result;
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var ac = response.Content.ReadAsAsync<Account[]>().Result;
                        HttpContext.Current.Session["CurUser"] = ac[0];
                        HttpContext.Current.Session["IsLogin"] = 1;
                    }
                }
                return true;
            }
            return false;
        }
        public static Account GetCurUser()
        {

            return (Account)HttpContext.Current.Session["CurUser"];
        }

        public static void Destroy()
        {
            HttpContext.Current.Session["IsLogin"] = 0;
            HttpContext.Current.Session["CurUser"] = null;
            HttpContext.Current.Response.Cookies["Username"].Expires =
               DateTime.Now.AddDays(-1);
        }
    }
}