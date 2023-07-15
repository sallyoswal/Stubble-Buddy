import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PastCompanyRequestsComponent } from './past-company-requests.component';

describe('PastCompanyRequestsComponent', () => {
  let component: PastCompanyRequestsComponent;
  let fixture: ComponentFixture<PastCompanyRequestsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PastCompanyRequestsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PastCompanyRequestsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
