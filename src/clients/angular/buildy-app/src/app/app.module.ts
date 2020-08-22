import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatNativeDateModule } from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatDialogModule } from '@angular/material/dialog';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatRadioModule } from '@angular/material/radio';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { MatToolbarModule } from '@angular/material/toolbar';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AboutComponent } from './components/about/about.component';
import { CaseAddComponent } from './components/build-computer/case/case-add/case-add.component';
import { CoolingAddComponent } from './components/build-computer/cooling/cooling-add/cooling-add.component';
import { CpuAddComponent } from './components/build-computer/cpu/cpu-add/cpu-add.component';
import { GpuAddComponent } from './components/build-computer/gpu/gpu-add/gpu-add.component';
import { MotherboardAddComponent } from './components/build-computer/motherboard/motherboard-add/motherboard-add.component';
import { PsuAddComponent } from './components/build-computer/psu/psu-add/psu-add.component';
import { RamAddComponent } from './components/build-computer/ram/ram-add/ram-add.component';
import { StorageAddComponent } from './components/build-computer/storage/storage-add/storage-add.component';
import { BuildComponent } from './components/build-form/build.component';
import { ContactComponent } from './components/contact/contact.component';
import { SaveBuildDialogComponent } from './components/dialogs/save-build-dialog/save-build-dialog.component';
import { FooterComponent } from './components/footer/footer.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { MyProfileComponent } from './components/my-profile/my-profile.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { RegisterComponent } from './components/register/register.component';
import { AuthInterceptorService } from './services/auth/auth-interceptor.service';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    FooterComponent,
    AboutComponent,
    ContactComponent,
    HomeComponent,
    BuildComponent,
    CpuAddComponent,
    GpuAddComponent,
    RamAddComponent,
    CaseAddComponent,
    CoolingAddComponent,
    MotherboardAddComponent,
    PsuAddComponent,
    StorageAddComponent,
    LoginComponent,
    RegisterComponent,
    SaveBuildDialogComponent,
    MyProfileComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatListModule,
    MatIconModule,
    MatButtonModule,
    FlexLayoutModule,
    MatSidenavModule,
    MatCardModule,
    MatExpansionModule,
    MatInputModule,
    FormsModule,
    ReactiveFormsModule,
    MatTableModule,
    MatPaginatorModule,
    HttpClientModule,
    MatProgressSpinnerModule,
    MatSortModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatRadioModule,
    MatDialogModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptorService,
      multi: true
    },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
