<app>
	<img src={ imageURL } ref="vibrantImg" onload={ getPalette }>
	<div class="color" each={ color, i in palette } style="background-color:rgba({color[0]},{color[1]},{color[2]},1)">
		<!-- { console.log(palette) } -->
	</div>
	<div class="dropzone" ondragover={ handleDragOver } ondrop={ handleFileSelect }>
		Drop Images Here
	</div>

	<script>
		var that = this;
		console.log('app.tag');
		this.imageURL = null;
		this.palette = [];

		getPalette(event) {
			console.log('getPalette');
			var colorThief = new ColorThief();
			this.palette = colorThief.getPalette(this.refs.vibrantImg, 8, 10);
		}

		handleDragOver(event) {
			console.log('handleDragOver');
			event.stopPropagation();
			event.preventDefault();
			return event.dataTransfer.dropEffect = "copy";
		}

		handleFileSelect(event) {
			console.log('handleFileSelect');
			event.stopPropagation();
			event.preventDefault();
			var files = event.dataTransfer.files;
			var f = files[0];
			var reader = new FileReader();
			console.log(f);

			var progress = function(event) {
				console.log('progress');
				var image = new Image(1920, 1080);
				that.imageURL = event.target.result;
				that.update();
			};

			var parseFile = function(theFile) {
			  return progress;
			};

			reader.onload = parseFile();
			// return data = reader.readAsDataURL(f);
			reader.readAsDataURL(f);
		}


	</script>

	<style>
		:scope {
			display: block;
		}
		.dropzone {
			border: 1px solid #DDD;
			padding: 15px;
			min-height: 300px;
			margin-top: 15px;
		}
		img {
			max-width: 400px;
		}
		.color {
			/*border: 1px solid #DDD;*/
			border-radius: 25px;
			margin-left: 10px;
			width: 50px;
			height: 50px;
			display: inline-block;
			box-shadow: 0px 2px 2px 0px rgba(0,0,0,0.25);
		}
	</style>
</app>
