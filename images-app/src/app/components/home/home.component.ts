import { Component, OnInit } from '@angular/core';
import { ImageService } from '../../services/image.service';
import { Imagen } from '../../models/imagen';

@Component({
  selector: 'app-home',
  standalone: false,
  templateUrl: './home.component.html'
})
export class HomeComponent implements OnInit {
  lstImages: Imagen[] = [];
  constructor(private imageService: ImageService) {}
  ngOnInit(): void {
    this.getImages();
  }

  getImages(): void {
    this.imageService.getImages().subscribe(data=> {
      this.lstImages = data;
      console.log(this.lstImages);
    })
  }



}
