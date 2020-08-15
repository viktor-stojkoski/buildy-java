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
import { MotherboardAddComponent } from './components/build-computer/motherboard/motherboard-add/motherboard-add.component';
import { PsuAddComponent } from './components/build-computer/psu/psu-add/psu-add.component';
import { StorageAddComponent } from './components/build-computer/storage/storage-add/storage-add.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';


const routes: Routes = [
  { path: '', component: HomeComponent },
  {
    path: 'build/add',
    children: [
      { path: 'cpu', component: CpuAddComponent },
      { path: 'cpu', component: CpuAddComponent },
      { path: 'gpu', component: GpuAddComponent },
      { path: 'ram', component: RamAddComponent },
      { path: 'case', component: CaseAddComponent },
      { path: 'cooling', component: CoolingAddComponent },
      { path: 'motherboard', component: MotherboardAddComponent },
      { path: 'psu', component: PsuAddComponent },
      { path: 'storage', component: StorageAddComponent },
    ]
  },
  { path: 'build/:id', component: BuildComponent },
  { path: 'build', component: BuildComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  { path: 'login', component: LoginComponent },
  { path: 'logout', component: LogoutComponent },
  { path: '**', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
