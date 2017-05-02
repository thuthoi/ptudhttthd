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
        }
    }
}