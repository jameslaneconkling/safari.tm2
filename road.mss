#road,
#bridge,
#tunnel{
  ['mapnik::geometry_type'=2] {
    line-color: @road;
    line-width: 0.4;
    line-opacity: 0.8;
    line-cap: round;
    line-join: round;
    [class='motorway'],
    [class='main'] {
      [zoom>=8] { line-width: 0.4; }
      [zoom>=10] { line-width: 0.8; }
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 2.2; }
      [zoom>=16] { line-width: 4; }
    }
    [class='street'],
    [class='street_limited'] {
      [zoom=12] { line-width: 0.3; }
      [zoom=13] { line-width: 0.5; }
      [zoom=14] { line-width: 0.8; }
      [zoom=15] { line-width: 1.2; }
      [zoom>=16] { line-width: 2; }
    }
    [class='street_limited'] { line-dasharray: 8,1; }
    [class='service'],
    [class='path'] {
      [zoom<=12] { line-width: 1; }
      [zoom=12] { line-width: 1; }
      [zoom=13] { line-width: 0.4; }
      [zoom=14] { line-width: 0.6; }
      [zoom=15] { line-width: 1.0; }
      [zoom>=16] { line-width: 1.6; }
    }
    //[type='track'],
    [type='trail'],
    [type='footway'],
    [type='path'] {
      line-color: @trail;
    }
    #bridge,
    #tunnel{ 
      line-cap: butt;
      line-color: darken(@road,5%); 
      line-dasharray: 2,1; 
    }
  }
}