body { font-family:Arial; font-size:14px; }
			body>span, body>h1 { float:left; width:100%; margin:0; padding:0; margin-bottom:10px; }
			
			span { color:#888888;
                >b { color:black; }
            }
			
			#selected { width:100%; margin-top:20px; }
            
            .vertical-centre (@height) { height:@height; line-height:@height !important; display:inline-block; vertical-align:middle; }
            .border-box { box-sizing:border-box; -moz-box-sizing:border-box; }
			.transition (@value1,@value2:X,...) { @value: ~`"@{arguments}".replace(/[\[\]]|\,\sX/g, '')`; -webkit-transition: @value; -moz-transition: @value; -ms-transition: @value; -o-transition: @value; transition: @value; }
			.transform (@value1,@value2:X,...) { @value: ~`"@{arguments}".replace(/[\[\]]|\,\sX/g, '')`; transform:@value; -ms-transform:@value; -webkit-transform:@value; -o-transform:@value; -moz-transform:@value; }
			
			@height:40px;
			@spacing:10px;
			@placeholder-colour:#AAA;
			@select-colour:#c5d2e0;
			@font-size:14px;
			@border-colour:#DDD;
			
			dropdown { margin-left:33%; display:block; width:33%;margin-top:20%;
				>div { float:left; width:100%;
					>div.dropdown-display { float:left; width:100%; background:white; height:@height; cursor:pointer; border:solid 1px @border-colour; .border-box;
						@icon-width:14px;
						>* { float:left; height:100%; .vertical-centre(@height); }
						>span { font-size:@font-size; width:100%; position:relative; .border-box; padding-right:@icon-width+@spacing*2; padding-left:@spacing;background-color: #c5d2e0;
							&.placeholder { color:@placeholder-colour; }
						}
						>i { position:relative; width:@icon-width; margin-left:(@spacing+@icon-width)*-1; font-size:1.125em; font-weight:bold; padding-right:@spacing; text-align:right; }
					}

					>div.dropdown-list { float:left; width:100%; position:relative; width:100%; .transform(scale(1, 0)); .transition(-webkit-transform ease 250ms); .transition(transform ease 250ms);
						>div { position:absolute; width:100%; z-index:2; cursor:pointer; background:white;
							>div { float:left; width:100%; padding:0 @spacing; font-size:@font-size; .border-box; border:solid 1px @border-colour; border-top:none;background-color: #c5d2e0;
								@icon-width:20px;
								&:hover { background:#364150; color:white;}
								&.selected { background:@select-colour; color:black; }
								>* { .vertical-centre(@height); }
								>span { float:left; width:100%; position:relative; padding-right:@icon-width+@spacing; .border-box; color:inherit; 
									>span { position: absolute;top: -80px;left: 35%; margin-left: 0%;padding: 5px;background-color: #364150;border-radius: 5px;display: none;color: #fff; font-size: 14px;  width: 50%;height:150%;text-align: center;}
									&:hover span { display: block;} 
								}
								>i { float:left; width:@icon-width; margin-left:@icon-width*-1; display:none; }
								&.selected>i { display:inline-block; }
							}
						}
					}
				}

				>div.show>div.dropdown-list { .transform(scale(1, 1)); }
			}
       