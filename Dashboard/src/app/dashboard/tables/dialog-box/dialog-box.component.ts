import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogConfig, MAT_DIALOG_DATA, MatDialogRef} from "@angular/material/dialog";

export interface DialogData {
  title: string;
  selectedId: JSON;
  amount: string;
};
@Component({
  selector: 'app-dialog-box',
  templateUrl: './dialog-box.component.html',
  styleUrls: ['./dialog-box.component.scss']
})
export class DialogBoxComponent implements OnInit {

  Amount: any;

  constructor(private dialog: MatDialog,
        private dialogRef: MatDialogRef<DialogBoxComponent>,
        @Inject (MAT_DIALOG_DATA) public data: DialogData
        ) { }

  ngOnInit(): void {
  }

  ngOnChanges(changes: any) {
    console.log(changes);
  }

  close(value) {
    this.dialogRef.close();
    this.Amount = value;
  }

}
