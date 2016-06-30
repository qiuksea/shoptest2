tinyMCE.init({
    selector: 'textarea.mceEditor',
    plugins : 'paste advlist autolink link image lists charmap print preview table hr searchreplace media textcolor emoticons',
    menubar: 'file edit insert view format table tools',
    //menu: {
    //    file: {title: 'File', items: 'newdocument | print'},
    //    edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall'},
    //    insert: {title: 'Insert', items: 'link media | template hr | charmap'},
    //    view: {title: 'View', items: 'visualaid'},
    //    format: {title: 'Format', items: 'bold italic underline strikethrough superscript subscript | formats | removeformat'},
    //    table: {title: 'Table', items: 'inserttable tableprops deletetable | cell row column'},
    //    tools: {title: 'Tools', items: 'spellchecker code'}
    //},
    //toolbar: [
    //    'undo redo | styleselect | bold italic | link',
    //    'alignleft aligncenter alignright'
    //],
    //toolbar: ['fontselect | fontsizeselect'],
    browser_spellcheck: true,
    resize: 'both',
    width : '100%'//,
    //height: 300

});
