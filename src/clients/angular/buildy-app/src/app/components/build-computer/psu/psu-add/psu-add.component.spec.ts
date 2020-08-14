import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PsuAddComponent } from './psu-add.component';

describe('PsuAddComponent', () => {
  let component: PsuAddComponent;
  let fixture: ComponentFixture<PsuAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PsuAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PsuAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
