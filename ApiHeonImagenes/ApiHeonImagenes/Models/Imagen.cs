using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiHeonImagenes.Models
{
    public class Imagen
    {
        public int IdImagen { get; set; }
        public int IdTipoImagen { get; set; }
        public String ImagenSerializada { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaActualizacion { get; set; }
        public string NombreTipoImagen { get; set; }

    }
}