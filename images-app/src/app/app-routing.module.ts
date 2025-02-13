import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { ImageFormComponent } from './components/image-form/image-form.component';

const routes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'saveimage/:id', component: ImageFormComponent},
  {path: 'saveimage', component: ImageFormComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
