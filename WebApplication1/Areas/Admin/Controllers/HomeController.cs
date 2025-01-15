using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            // Kiểm tra nếu người dùng không phải là admin, chuyển hướng về trang chủ
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                return RedirectToAction("Index", "Home");
            }

            // Cập nhật tab đang hoạt động cho sidebar (nếu cần)
            ViewData["Active"] = "Home";

            // Trả về View cho trang quản trị viên
            return View();
        }
    }
}