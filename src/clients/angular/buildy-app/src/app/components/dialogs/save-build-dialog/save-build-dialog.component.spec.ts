import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SaveBuildDialogComponent } from './save-build-dialog.component';

describe('SaveBuildDialogComponent', () => {
  let component: SaveBuildDialogComponent;
  let fixture: ComponentFixture<SaveBuildDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SaveBuildDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SaveBuildDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
