import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Imagen } from '../models/imagen';

@Injectable({
  providedIn: 'root'
})
export class ImageService {

  private apiUrl: string = "http://localhost:53322/api/imagenes";
  constructor(private httpClient: HttpClient) { }

  getImages(): Observable<Imagen[]> {
    return this.httpClient.get<Imagen[]>(this.apiUrl);
  }
  saveImages(imagen: Imagen): Observable<Imagen> {
    return this.httpClient.post<Imagen>(this.apiUrl, imagen);
  }
  deleteImage(id: number): Observable<any> {
    return this.httpClient.delete<any>(this.apiUrl + '/' + id);
  }
  getImage(id: number): Observable<Imagen[]> {
    return this.httpClient.get<Imagen[]>(this.apiUrl + '/' + id);
  }
}

