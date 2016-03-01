// $(document).ready(function (){

	
//     var source =
//         {
//             datatype: "json",
//             datafields: [
//             { name: 'id',type: 'number'},
//             { name: 'razon_social_href',type: 'string'},
//             { name: 'razon_social',type: 'string'},
//             { name: 'foto'},
//             ],
//             url: '/clientes/dashboard',
//             cache: false
//         };
//         var dataAdapter = new $.jqx.dataAdapter(source);
        

//         $("#jqxgrid").jqxGrid({
//             width: '100%',
//             height: '450',
//             source: dataAdapter,
//             sortable: true,
//             altRows: true,
//             columnsresize: true,
//             pageable: true,
//             pagerMode: 'advanced',
//             theme: 'custom',
//             //scrollmode: 'deferred',
//             // showstatusbar: true,
//             showfilterrow: true,
//             filterable: true,
//             autorowheight: true,
//             keyboardnavigation: false,
//             scrollfeedback: function (row)
//             {
//                 return '<table style="height: 80px;"><tr><td><img src="' + row.foto + '"  height="90"/></td></tr><tr><td>' + row.producto + '</td></tr></table>';
//             },

//             columns: [
//             {text: 'Image', datafield: 'foto', width: 100, cellsrenderer: function (row, column, value) {
//                 return '<img style="margin-left: 5px;" height="70" width="100%" src="' + value + '" />';
//                 }
//             },
//             { text: 'Razón Social', columngroup: 'cliente',datafield: 'razon_social_href', filtertype: 'input',width: '15%' },
//             // { text: 'Contrato', columngroup: 'cliente',datafield: 'telefono', filtertype: 'input',width: '8%'},
//             // { text: 'Total', columngroup: 'cliente',datafield: 'celular', filtertype: 'input',width: '8%'},
//             // { text: 'Deposito', columngroup: 'cliente',datafield: 'correo', filtertype: 'input',width: '8%'},
//             // { text: 'Por Cobrar', columngroup: 'cliente',datafield: 'direccion', filtertype: 'input',width: '20%'},
//             // { text: 'Mora', columngroup: 'cliente',datafield: 'estado', filtertype: 'input',width: '8%'},
//             ],
//             columngroups: [
//             { text: 'CLIENTES CON CONTRATOS CON MAYOR RECAUDACION', align: 'center', name: 'cliente' },
//             ]
//         });


		
// })