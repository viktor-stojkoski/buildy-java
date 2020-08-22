import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {

  constructor(private router: Router) { }

  public navigateToBuild(): void {
    this.router.navigate(['build']);
  }

  public navigateToOurBuild(buildId: number): void {
    this.router.navigate(['build', buildId]);
  }
}
