import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GpuAddComponent } from './gpu-add.component';

describe('GpuAddComponent', () => {
  let component: GpuAddComponent;
  let fixture: ComponentFixture<GpuAddComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GpuAddComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GpuAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
