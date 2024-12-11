using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Context;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller

    {
        ASP_NETEntities objASP_NETEntities = new ASP_NETEntities();
       
        public ActionResult Index()
        {
            var lstProduct = objASP_NETEntities.Products.ToList();
            return View(lstProduct);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}