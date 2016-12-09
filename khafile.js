let project = new Project('Showcase');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('Sdg');
project.windowOptions.width = 800;
project.windowOptions.height = 600;
resolve(project);
