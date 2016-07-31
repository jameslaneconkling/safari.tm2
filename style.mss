// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
@font: 'Arial Unicode MS Regular'; //'Source Sans Pro Semibold';
  
@bg: #fff;

//@water: #cde2e2; 
@water: #efefef;
@water-casing: #999;//darken(@water, 30%);
@road: #cacaca;
@trail: #666;
@admin-boundary: #444;

@wood:#eee;
//@wood: #b4e0b8;
@park: #b4e0b8;

Map {
  background-color: @bg;
}
#admin::country-low[admin_level=2][maritime=0][zoom<7] {
  ::halo {
    line-width: 2;
    [zoom>=5]{ line-width: 3; }
    line-opacity: 0.2;
    line-comp-op: multiply;
    line-color: #888;  
  }
  ::fill {
    line-width: 0.8;
    line-color: lighten(@admin-boundary,20%);
  }
}
#admin::country-high[admin_level=2][maritime=0][zoom>=7] {
  ::halo {
    line-color: #ccc; //#ffcd6a;
    line-join: round;
    line-cap: round;
    line-smooth: 1;
    line-opacity: 0.4;
    [zoom>=6] { line-width: 3; }
    [zoom>=9] { line-width: 3.2; }
    [zoom>=10] { line-width: 3.8; }
    [zoom>=11]{ line-width: 4; }
    [zoom>=12]{ line-width: 5; }
    [zoom>=14]{ line-width: 6; }
  }
  ::case {
    line-color: @admin-boundary;
    line-join: round;
    line-cap: round;
    line-smooth: 1;
    line-width: 1.5;
    [zoom>=7] { line-width: 1.5; }
    [zoom>=10] { line-width: 1.8; }
    [zoom>=11]{ line-width: 2; }
  }
  ::fill {
    line-color: white;
    line-join: round;
    line-cap: round;
    line-smooth: 1;
    line-width: 1;
    [zoom>=7] { line-width: 0.7; line-dasharray: 3,2; }
    [zoom>=9] { line-width: 0.8; line-dasharray: 4,2.5; }
    [zoom>=11]{ line-width: 1.0; line-dasharray: 4.5,3; }
  }
}

#admin::subcountry[maritime !=1 ][admin_level>=3] {
  line-width: 0.6;
  line-color: #aaa;
  [zoom >=7] {
    ::double-stroke {
      line-color: #ddd;
      line-opacity: 0.4;
      line-width: 1;
      [zoom>=7]{ line-width: 1; }  
      [zoom>=8]{ line-width: 1.5; }
      [zoom>=10]{ line-width: 2.0; }
      [zoom>=12]{ line-width: 3.0; }
    }
    line-join: round;
    line-color: @admin-boundary;
    [zoom >= 7]{ line-width: 0.4; }
    [zoom >= 8]{ line-width: 0.6; line-dasharray: 4,2; }
    [zoom >= 10]{ line-width: 0.8; }
    [zoom >= 12]{ line-width: 1.2; }
  }
}

#building {
  polygon-fill: #bbb;
  line-width:0.4;
  line-color: #999;
}


