import { Component, OnInit } from '@angular/core';
import { Imagen } from '../../models/imagen';
import { ActivatedRoute } from '@angular/router';
import { ImageService } from '../../services/image.service';

@Component({
  selector: 'app-image-form',
  standalone: false,
  templateUrl: './image-form.component.html',
})
export class ImageFormComponent implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private imageService: ImageService
  ) {}
  image: Imagen = {
    FechaActualizacion: new Date(),
    FechaCreacion: new Date(),
    IdImagen: 0,
    IdTipoImagen: 0,
    ImagenSerializada: '',
    NombreTipoImagen: '',
  };
  idImage: string | null = null;
  ngOnInit(): void {
    this.route.paramMap.subscribe((data) => {
      this.idImage = data.get('id');
      if (this.idImage != null) {
        this.imageService.getImage(parseInt(this.idImage)).subscribe(data=> {
          this.image = data[0];
          this.image.ImagenSerializada= this.image.ImagenSerializada.replace('\\','/')
          console.log(this.image);
        });
      }
    });
  }

  setImageFile(event: Event) {
    const htmlElement = event.target as HTMLInputElement;
    let realLocation = htmlElement.value.replace('fakepath', 'Users\\Nicolas\\Pictures\\Wallpapers')
    this.image.ImagenSerializada = realLocation
    
  }

  sendImage() { 
    console.log(this.image)
    this.imageService.saveImages(this.image).subscribe(data=> {
      console.log(data);
    });
  }
}
