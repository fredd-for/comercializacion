<?php

class DasboardController extends ControllerBase {
	public function solicitudesAction()
    {
        $this->view->disable();
       $category = array();
$category['name'] = 'Meses';

$series15 = array();
$series15['name'] = 'Wordpress';

$series2 = array();
$series2['name'] = 'CodeIgniter';

$series3 = array();
$series3['name'] = 'Highcharts';

// while($r = mysql_fetch_array($query)) {
    $category['data'][] = 'Ene';
    $series15['data'][] = 25;
    $series2['data'][] = 46;
    $series3['data'][] = 2;  

$category['data'][] = 'Feb';
    $series15['data'][] = 25;
    $series2['data'][] = 46;
    $series3['data'][] = 2;  

    $category['data'][] = 'Mar';
    $series15['data'][] = 25;
    $series2['data'][] = 46;
    $series3['data'][] = 2;  
// }

$result = array();
array_push($result,$category);
array_push($result,$series15);
array_push($result,$series2);
array_push($result,$series3);

echo json_encode($result, JSON_NUMERIC_CHECK);

    }
}