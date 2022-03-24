import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-layout-a',
  templateUrl: './layout-a.component.html',
  styleUrls: ['./layout-a.component.css']
})
export class LayoutAComponent implements OnInit {
  user = 'Dora Vega'

  constructor() { }

  ngOnInit(): void {
  }

}
