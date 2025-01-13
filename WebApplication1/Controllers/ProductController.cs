using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Context;

namespace WebApplication1.Controllers
{
    public class ProductController : Controller
    {
        web_aspEntities objweb_aspEntities = new web_aspEntities();
        // GET: Product
        public ActionResult Detail(int Id)
        {
            var objProduct = objweb_aspEntities.Products.Where(n=>n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}