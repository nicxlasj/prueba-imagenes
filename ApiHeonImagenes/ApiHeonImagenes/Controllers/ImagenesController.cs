using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ApiHeonImagenes.Models;
using Dapper;
using System.Data.SqlClient;
using System.Configuration;
using System;
using System.Drawing;
using System.IO;

namespace ApiHeonImagenes.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ImagenesController : ApiController
    {
        
        private string connectionString = ConfigurationManager.ConnectionStrings["localDB"].ConnectionString;

        [HttpGet]
        [Route("api/Imagenes/{id?}")]
        public IHttpActionResult GetEmpleados(int? id = null)
        {
            using (var db = new SqlConnection(connectionString))
            {
                var result = db.Query<Imagen>("SpGetImagenes", new { IdImagen = id }, commandType: System.Data.CommandType.StoredProcedure).ToList();
                foreach (var item in result.ToList())
                {
                    var base64Decode = System.Convert.FromBase64String(item.ImagenSerializada);
                    item.ImagenSerializada = System.Text.Encoding.UTF8.GetString(base64Decode);
                }
                
                return Ok(result);
       
            }
        }

        [HttpPost]
        [Route("api/imagenes")]
        public IHttpActionResult SaveImagen([FromBody]Imagen imagen)
        {
            var plainText = System.Text.Encoding.UTF8.GetBytes(imagen.ImagenSerializada);
            var file1 = System.Convert.ToBase64String(plainText);


            using (var db = new SqlConnection(this.connectionString))
            {
                var result = db.Query<Imagen>("SpSaveImagenes", new { IdImagen = imagen.IdImagen, IdTipoImagen = imagen.IdTipoImagen, ImagenSerializada = file1 }, commandType: System.Data.CommandType.StoredProcedure);
                return Ok(result);

            }
        }


        [HttpDelete]
        [Route("api/imagenes/{id}")]
        public IHttpActionResult DeleteImagen(int id)
        {
            using (var db = new SqlConnection(this.connectionString))
            {
                var result = db.Query("SpDeleteImagen", new { IdImagen = id }, commandType: System.Data.CommandType.StoredProcedure);
                return Ok();
            }
        }
    }
}
