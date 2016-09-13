
var app = angular.module("demo", []);

            app.controller("dropdownDemo", function($scope) {
				$scope.list = [{
					name: "John",
					Vehicle:"SGD1234F"
				}, {
					name: "Kumar",
					Vehicle:""
				},{
					name: "",
					Vehicle:"SGD2984F"
				}, {
					name: "Jake",
					Vehicle:"SGD2345F"
				}, ];
                $scope.select = "";


            });
			
			app.run(function($rootScope) {
				angular.element(document).on("click", function(e) {
					$rootScope.$broadcast("documentClicked", angular.element(e.target));
				});
			});
			
            app.directive("dropdown", function($rootScope) {
                return {
					restrict: "E",
					templateUrl: "templates/dropdown.html",
					scope: {
						placeholder: "@",
						list: "=",
						selected: "=",
						property: "@"
					},
					link: function(scope) {
						scope.listVisible = false;
						scope.isPlaceholder = true;

						scope.select = function(item) {
							scope.isPlaceholder = false;
							scope.selected = item;
							if (scope.onChange !== undefined)
								scope.onChange(item);
						};

						scope.isSelected = function(item) {

							return item[scope.property] === scope.selected[scope.property];
						};
						
						scope.show = function() {
							scope.listVisible = true;
						};

						
						$(".dropdown-list").find('input').on("click", function(e){
	 						e.stopPropagation();
    							});
						
						$rootScope.$on("documentClicked", function(inner, target) {
							if (!$(target[0]).is(".dropdown-display.clicked") && !$(target[0]).parents(".dropdown-display.clicked").length > 0)
								scope.$apply(function() {
									scope.listVisible = false;
								});
						});

						//Here get the selected value of the dropdown list 
						scope.$watch("selected", function(value) {
							scope.isPlaceholder = scope.selected[scope.property] === undefined;
							if(value.name=="")
							{
							scope.display = scope.selected["Vehicle"];
							}
							if(value.Vehicle=="")
							{
							scope.display = scope.selected["name"];
							}
							if(value.name !=="" && value.Vehicle!=="")
							{
							scope.display = value.name+"/"+value.Vehicle;

							}

						});
					}
				}
            });


