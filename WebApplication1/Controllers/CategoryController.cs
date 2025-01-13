using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Context;

namespace WebApplication1.Controllers
{
    public class CategoryController : Controller
    {
        web_aspEntities objweb_aspEntities = new web_aspEntities();
        // GET: Category
        public ActionResult AllCategory(int Id)
        {
            var listProduct = objweb_aspEntities.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
           
        }
        public ActionResult ProductByCategory()
        {
           
            return View();
        }
    }
}