function makePreview(element_class, rows) {
	console.log('makePreview from' + element_class)
	var previews = document.getElementsByClassName(element_class);

    for ( var i = 0; i < previews.length; i++ ) {
      $clamp(previews[i], {clamp: rows});
    }
}