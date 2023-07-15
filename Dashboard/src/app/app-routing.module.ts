import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FarmerListComponent } from './farmer-list/farmer-list.component';
import { CompanyListComponent } from './company-list/company-list.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { PastFarmerRequestsComponent } from './past-farmer-requests/past-farmer-requests.component';
import { PastCompanyRequestsComponent } from './past-company-requests/past-company-requests.component';
import { DataVisualComponent } from './data-visual/data-visual.component';
import { LinechartComponent } from './data-visual/linechart/linechart.component';
import { CRequestChartComponent } from './data-visual/crequest-chart/crequest-chart.component';
import { AmountTransferComponent } from './amount-transfer/amount-transfer.component';
const routes: Routes = [
  { path: 'farmer-list', component: FarmerListComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: 'company-list', component: CompanyListComponent },
  { path: 'past-farmer-requests', component: PastFarmerRequestsComponent },
  { path: 'past-company-requests', component: PastCompanyRequestsComponent },
  { path: 'data-visual', component: DataVisualComponent },
  { path: 'data-visual/linechart', component: LinechartComponent },
  { path: 'data-visual/crequest-chart', component: CRequestChartComponent },
  { path: 'amount-transfer', component: AmountTransferComponent },
  { path: '**', component: DashboardComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { 
}
