import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FarmerListComponent } from './farmer-list/farmer-list.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AgGridModule } from 'ag-grid-angular';
import { CompanyListComponent } from './company-list/company-list.component';
import { TablesComponent } from './dashboard/tables/tables.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { DialogBoxComponent } from './dashboard/tables/dialog-box/dialog-box.component';
import { MatDialogModule, MatDialogRef, MatDialogConfig, MatDialog } from '@angular/material/dialog';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { PastFarmerRequestsComponent } from './past-farmer-requests/past-farmer-requests.component';
import { PastCompanyRequestsComponent } from './past-company-requests/past-company-requests.component';
import { FormsModule } from '@angular/forms';
import { DataVisualComponent } from './data-visual/data-visual.component';
import { LinechartComponent } from './data-visual/linechart/linechart.component';
import { CRequestChartComponent } from './data-visual/crequest-chart/crequest-chart.component';
import { AmountTransferComponent } from './amount-transfer/amount-transfer.component';

@NgModule({
  declarations: [
    AppComponent,
    FarmerListComponent,
    DashboardComponent,
    CompanyListComponent,
    TablesComponent,
    DialogBoxComponent,
    PastFarmerRequestsComponent,
    PastCompanyRequestsComponent,
    DataVisualComponent,
    LinechartComponent,
    CRequestChartComponent,
    AmountTransferComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    FormsModule,
    MatDialogModule,
    AgGridModule.withComponents([]),
    BrowserAnimationsModule,
    MatInputModule,
    MatSelectModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  entryComponents: [DialogBoxComponent]
})
export class AppModule { }
