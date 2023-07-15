import { Component,ViewChild, OnInit, Input, ChangeDetectionStrategy } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GridOptions } from 'ag-grid-community';
import { DialogBoxComponent } from "./dialog-box/dialog-box.component";
import { MatDialogConfig, MatDialog, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-tables',
  templateUrl: './tables.component.html',
  styleUrls: ['./tables.component.scss']
})
export class TablesComponent implements OnInit {

  domLayout = "autoHeight";
  gridOptions: any;
  
  identifier1 : object;

  @Input() number;

  columnDefs = [];
  rowData : any;  

  amount : any;
  @ViewChild ( DialogBoxComponent ) child : DialogBoxComponent;

  constructor(private http: HttpClient,private dialog: MatDialog) { 

  }

  ngOnInit() {

    let obj = {'id' : "1"};
    this.identifier1 = {...obj};

    this.columnDefs = [
      {field: 'Request Id', width : 260, sortable: true, filter: true, resizable: true},
      {field: 'Farmer Id' , width : 260, sortable: true, filter: true, resizable: true},
      {field: 'Farmer Name', width : 260, sortable: true, filter: true, resizable: true},
      {field: 'Request Date', width : 260, sortable: true, filter: true, resizable: true},
    ];
    this.gridOptions = <GridOptions>{
      rowSelection: 'multiple',
      rowMultiSelectWithClick: true,
    };
    this.http.get('https://gmqmy2zkyj.execute-api.us-east-1.amazonaws.com/default/ReadF_Requests')
    .subscribe((data: any) => {
      this.rowData = data;
      this.gridOptions.api.setColumnDefs(this.columnDefs);
      this.gridOptions.api.setRowData(this.rowData);
    });
  }

  ngOnChanges(changes: any){
    if(changes) {
      let identifier = changes['number'].currentValue;
      this.identifier1 = identifier;
      if(identifier && identifier.id === "1") {
        this.columnDefs = [
          {field: 'Request Id', width : 260, sortable: true, filter: true, resizable: true},
          {field: 'Farmer Id' , width : 260, sortable: true, filter: true, resizable: true},
          {field: 'Farmer Name', width : 260, sortable: true, filter: true, resizable: true},
          {field: 'Request Date', width : 260, sortable: true, filter: true, resizable: true},
        ];

        this.http.get('https://gmqmy2zkyj.execute-api.us-east-1.amazonaws.com/default/ReadF_Requests')
        .subscribe((data: any) => {
          this.rowData = data;
          this.gridOptions.api.setColumnDefs(this.columnDefs);
          this.gridOptions.api.setRowData(this.rowData);
        });

      } else if(identifier && identifier.id === "2") {
        this.columnDefs = [
          {field: 'Request Id', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Farmer Id' , width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Farmer Name', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Request Date', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Stubble Amount', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Request Status', width : 175, sortable: true, filter: true, resizable: true},
        ];

        this.http.get('https://y6j3i4n4ul.execute-api.us-east-1.amazonaws.com/Default/resource')
        .subscribe((data: any) => {
          this.rowData = data;
          this.gridOptions.api.setColumnDefs(this.columnDefs);
          this.gridOptions.api.setRowData(this.rowData);
        });
      
      } else if(identifier && identifier.id === "3") {
        this.columnDefs = [
          {field: 'Request Id' , width : 210, sortable: true, filter: true, resizable: true},
          {field: 'Company Id', width : 210, sortable: true, filter: true, resizable: true},
          {field: 'Company Name', width : 210, sortable: true, filter: true, resizable: true},
          {field: 'Order Date', width : 210, sortable: true, filter: true, resizable: true},
          {field: 'Stubble Amount', width : 210, sortable: true, filter: true, resizable: true},
        ];

        this.http.get('https://2svg42oyw8.execute-api.us-east-1.amazonaws.com/default/FetchCompanyRequests')
        .subscribe((data: any) => {
          this.rowData = data;
          this.gridOptions.api.setColumnDefs(this.columnDefs);
          this.gridOptions.api.setRowData(this.rowData);
        });
      } else if(identifier && identifier.id === "4") {
        this.columnDefs = [
          {field: 'Request Id', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Farmer Id' , width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Farmer Name', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Request Date', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Stubble Amount', width : 175, sortable: true, filter: true, resizable: true},
          {field: 'Request Status', width : 175, sortable: true, filter: true, resizable: true},
        ];

        this.http.get('https://jqb3nhvgzf.execute-api.us-east-1.amazonaws.com/default/GetDistrFReqInProcess')
        .subscribe((data: any) => {
          this.rowData = data;
          this.gridOptions.api.setColumnDefs(this.columnDefs);
          this.gridOptions.api.setRowData(this.rowData);
        });
      
      }
    }
  }

  RowSelection() {
    this.openDialog(this.identifier1)
  }

  openDialog(identifier) {

    if(identifier && identifier.id === "1"){
      const dialogConfig = new MatDialogConfig();
      var selectedId = this.gridOptions.api.getSelectedRows();
      dialogConfig.disableClose = false;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '500px';
      dialogConfig.data = {
        title : 'Enter the Amount of Stubble Collected',
        selectedId: selectedId,
        amount : this.amount
      }
  
      const dialogRef1= this.dialog.open(DialogBoxComponent, dialogConfig);
      dialogRef1.afterClosed().subscribe(
        (data : any) => {
              var querydata = data.selectedId[0];
              var stubbleAmt = data.amount;
              querydata['Stubble Amount'] = stubbleAmt;
              querydata['Request Status'] = 'InTransit';
              let reqData = { 
              requestId: querydata['Request Id'],
              farmerId: querydata['Farmer Id'], 
              farmerName: querydata['Farmer Name'],
              requestDate: querydata['Request Date'],
              stubbleAmt: querydata['Stubble Amount'],
              requestStatus: querydata['Request Status'] };
              this.http.post('https://f17kbeswng.execute-api.us-east-1.amazonaws.com/default/ProcessFarmerRequests', reqData 
              ).subscribe((data: any) =>{
                    var status = data;
                    if(status === "1 1")
                    {
                      const selectedRow = this.gridOptions.api.getFocusedCell()
                      const id = this.gridOptions.rowData[selectedRow.rowIndex].i

                      this.gridOptions.rowData.splice(selectedRow.rowIndex, 1)
                      this.gridOptions.api.setRowData(this.gridOptions.rowData)
                    }
                    console.log(status);
                })
              //console.log(data);
      });
      
    } else if(identifier.id == "3") {
      var selectedId = this.gridOptions.api.getSelectedRows();
      var querydata = selectedId[0];
      let reqData = {
        stubbleAmt: querydata['Stubble Amount'],
        requestId: querydata['Request Id'],
        companyId: querydata['Company Id']
      };
      this.http.post('https://fkayo55ssf.execute-api.us-east-1.amazonaws.com/default/ProcessCompanyRequest', reqData 
      ).subscribe((data: any) =>{
            var status = data;
            if(status === "false 0")
            {
              const selectedRow = this.gridOptions.api.getFocusedCell()
              const id = this.gridOptions.rowData[selectedRow.rowIndex].i

              this.gridOptions.rowData.splice(selectedRow.rowIndex, 1)
              this.gridOptions.api.setRowData(this.gridOptions.rowData)
            }
            console.log(status);
      })
    }
        
  } 

  DistributedReq(){
      this.proceedDistrReq(this.identifier1)
  }

  proceedDistrReq(identifier) {
    if(identifier && identifier.id === "1")
    {
      const dialogConfig = new MatDialogConfig();
      var selectedId = this.gridOptions.api.getSelectedRows();
      dialogConfig.disableClose = false;
      dialogConfig.autoFocus = true;
      dialogConfig.width = '500px';
      dialogConfig.data = {
        title : 'Enter the Amount of Stubble Collected',
        selectedId: selectedId,
        amount : this.amount
      }
  
      const dialogRef1= this.dialog.open(DialogBoxComponent, dialogConfig);
      dialogRef1.afterClosed().subscribe(
        (data : any) => {
              var querydata = data.selectedId[0];
              var stubbleAmt = data.amount;
              querydata['Stubble Amount'] = stubbleAmt;
              querydata['Request Status'] = 'InTransit';
              let reqData = { 
              requestId: querydata['Request Id'],
              farmerId: querydata['Farmer Id'], 
              farmerName: querydata['Farmer Name'],
              requestDate: querydata['Request Date'],
              stubbleAmt: querydata['Stubble Amount'],
              requestStatus: querydata['Request Status'] };
              this.http.post('https://oirk8em2tf.execute-api.us-east-1.amazonaws.com/default/DistributeFReqInProcess', reqData 
              ).subscribe((data: any) =>{
                    var status = data;
                    if(status === "1 1")
                    {
                      const selectedRow = this.gridOptions.api.getFocusedCell()
                      const id = this.gridOptions.rowData[selectedRow.rowIndex].i

                      this.gridOptions.rowData.splice(selectedRow.rowIndex, 1)
                      this.gridOptions.api.setRowData(this.gridOptions.rowData)
                    }
                    console.log(status);
                })
              //console.log(data);
      });
    }
  }

}
