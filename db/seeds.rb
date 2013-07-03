#encoding: UTF-8
users = User.create([{name:                  'Administrator', 
	      							lastname:              'Principal', 
	      							email:                 'admin@sdesk.com', 
	      							password:              'admin123', 
	      							password_confirmation: 'admin123',
	      							role:                  'admin'},
	      						 {name:                  'Juan', 
	      							lastname:              'Pérez', 
	      							email:                 'analista1@sdesk.com', 
	      							password:              'analista123', 
	      							password_confirmation: 'analista123',
	      							role:                  'analyst'},
	      						 {name:                  'Pedro', 
	      							lastname:              'Rodriguez', 
	      							email:                 'analista2@sdesk.com', 
	      							password:              'analista123', 
	      							password_confirmation: 'analista123',
	      							role:                  'analyst'},
	      						 {name:                  'Alonso', 
	      							lastname:              'Poblete', 
	      							email:                 'cliente1@sdesk.com', 
	      							password:              'cliente123', 
	      							password_confirmation: 'cliente123',
	      							role:                  'client'},
	      						 {name:                  'Cristobal', 
	      							lastname:              'Martinez', 
	      							email:                 'cliente2@sdesk.com', 
	      							password:              'cliente123', 
	      							password_confirmation: 'cliente123',
	      							role:                  'client'}])

solutions = Solution.create([{name: "Solución 1", description: "Consiste en la solución1"},
														 {name: "Solución 1", description: "Consiste en la solución2"}])

categories = Category.create([{name: "Catergoría 1", description: "Consiste en la primera categoría"},
														  {name: "Catergoría 2", description: "Consiste en la segunda categoría"}])

incident_statuses = IncidentStatus.create([	{id: 1, name: "created"},
														  							{id: 2, name: "assigned"},
														  							{id: 3, name: "processing"},
														  							{id: 4, name: "closed"},
														  							{id: 5, name: "reopen"}])

analyst_statuses = AnalystStatus.create([	{id: 1, name: "available"},
														  						{id: 2, name: "not available"}])