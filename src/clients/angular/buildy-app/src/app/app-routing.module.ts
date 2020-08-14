import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './components/about/about.component';
import { ContactComponent } from './components/contact/contact.component';
import { HomeComponent } from './components/home/home.component';
import { BuildComponent } from './components/build-form/build.component';
import { CpuAddComponent } from './components/build-computer/cpu/cpu-add/cpu-add.component';
import { GpuAddComponent } from './components/build-computer/gpu/gpu-add/gpu-add.component';
import { RamAddComponent } from './components/build-computer/ram/ram-add/ram-add.component';
import { CaseAddComponent } from './components/build-computer/case/case-add/case-add.component';
import { CoolingAddComponent } from './components/build-computer/cooling/cooling-add/cooling-add.component';


const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'build/add/cpu', component: CpuAddComponent },
  { path: 'build/add/gpu', component: GpuAddComponent },
  { path: 'build/add/ram', component: RamAddComponent },
  { path: 'build/add/case', component: CaseAddComponent },
  { path: 'build/add/cooling', component: CoolingAddComponent },
  { path: 'build/:id', component: BuildComponent },
  { path: 'build', component: BuildComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
