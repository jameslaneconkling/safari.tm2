@road: #777;
#road,
#bridge,
#tunnel{
  ['mapnik::geometry_type'=2] {
    line-color: @road;
    line-width: 0.4;
    line-opacity: 0.8;
    [class='motorway'],
    [class='main'] {
      [zoom>=8] { line-width: 0.4; }
      [zoom>=10] { line-width: 0.8; }
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 2.2; }
      [zoom>=16] { line-width: 4; }
    }
    [class='street'],
    [class='street_limited'],
    [class='service']{
      [zoom=12] { line-width: 0.3; }
      [zoom=13] { line-width: 0.5; }
      [zoom=14] { line-width: 0.8; }
      [zoom=15] { line-width: 1.2; }
      [zoom>=16] { line-width: 2; }
    }
    [class='street_limited'] { line-dasharray: 8,1; }
    [class='service']{ 
      [zoom=12] { line-width: 0.2; }
      [zoom=13] { line-width: 0.4; }
      [zoom=14] { line-width: 0.6; }
      [zoom=15] { line-width: 1.0; }
      [zoom>=16] { line-width: 1.6; }
    }
    #bridge,#tunnel{ line-color: lighten(@road,20%); }
    #tunnel{ line-dasharray: 1,2; }
  }
}