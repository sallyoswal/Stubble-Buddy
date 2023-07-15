import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PastFarmerRequestsComponent } from './past-farmer-requests.component';

describe('PastFarmerRequestsComponent', () => {
  let component: PastFarmerRequestsComponent;
  let fixture: ComponentFixture<PastFarmerRequestsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PastFarmerRequestsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PastFarmerRequestsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
