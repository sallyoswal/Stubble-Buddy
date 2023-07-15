import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GridOptions } from 'ag-grid-community';

@Component({
  selector: 'app-farmer-list',
  templateUrl: './farmer-list.component.html',
  styleUrls: ['./farmer-list.component.scss']
})
export class FarmerListComponent implements OnInit {
    
  domLayout = "autoHeight";
  gridOptions: any;

  columnDefs = [];
  rowData : any;  

  constructor(private http: HttpClient) { }

  ngOnInit() {

    this.columnDefs = [
      {field: 'Farmer Id' , width : 216, sortable: true, filter: true, resizable: true},
      {field: 'Farmer Name', width : 216, sortable: true, filter: true, resizable: true},
      {field: 'Address', width : 216, sortable: true, filter: true, resizable: true},
      {field: 'Phone No', width : 216, sortable: true, filter: true, resizable: true},
      {field: 'Documents', width : 216, sortable: true, filter: true, resizable: true},
    ];
    this.gridOptions = <GridOptions>{};
    this.http.get('https://mldsqwi1w2.execute-api.us-east-1.amazonaws.com/default/ReadFarmerDetails')
    .subscribe((data: any) => {
      this.rowData = data;
      this.gridOptions.api.setColumnDefs(this.columnDefs);
      this.gridOptions.api.setRowData(this.rowData);
    });

  }

}
