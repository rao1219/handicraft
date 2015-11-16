<?php
class operate{
    //获取一行数据
    public static function getoneline($table,$condition,$filed="*"){
        $osql='select '.$filed.' from '.$table.' where '.$condition;
        return @mysql_fetch_array(mysql_query($osql));
    }
    //获取数据数组
    public static function getmuchline($table,$condition="",$filed="*"){
        $osql='select '.$filed.' from '.$table;
        if($condition){$osql.=" $condition";}
        //echo $osql;exit;
        $result=mysql_query($osql);
        for($i=0;$i<mysql_num_rows($result);$i++){
             $rs[]=mysql_fetch_array($result);
        }
        if(!isset($rs)){
            $rs=false;
        }
        return $rs;
    }
    //获取数据数组
    public static function getmuchlinesql($sql){
        //echo $sql;
        $result=mysql_query($sql);
        for($i=0;$i<mysql_num_rows($result);$i++){
             $rs[]=mysql_fetch_array($result);
        }
        if(!isset($rs)){
            $rs=false;
        }
        return $rs;
    }
    //更新一条数据
    public static function updateoneline($table,$datetitle,$datecontent,$condition){
        $datecontent[0]=str_replace("'","\'",$datecontent[0]);
        $osql='update '.$table.' set '.$datetitle[0].'=\''.$datecontent[0].'\'';
        for($i=1;$i<count($datetitle);$i++){
            $datecontent[$i]=str_replace("'","\'",$datecontent[$i]);
            $osql.=','.$datetitle[$i].'=\''.$datecontent[$i].'\'';
        }
        $osql.=' where '.$condition;
        return mysql_query($osql);
    }
    //插入一条数据
    public static function insertoneline($table,$datetitle,$datecontent){
        $osql='insert into '.$table.' ('.$datetitle[0];
        for($i=1;$i<count($datetitle);$i++){
            $osql.=','.$datetitle[$i];
        }
        $osql.=') values (\''.$datecontent[0].'\'';
        for($i=1;$i<count($datecontent);$i++){
            $datecontent[$i]=str_replace("'","\'",$datecontent[$i]);
            $osql.=',\''.$datecontent[$i].'\'';
        }
        $osql.=')';
		//echo $osql;exit;
        return mysql_query($osql);
    }
    //插入一条数据(数组)
    public static function insertonearray($table,$date){
		$name=array();
		$data=array();
		foreach($date as $key => $val){
			$name[]=$key;
			$data[]=$val;
		}
        return operate::insertoneline($table,$name,$data);
    }
    //删除一条数据
    public static function deletedata($table,$datecontent){
        $osql='delete from '.$table.' where '.$datecontent;
        return mysql_query($osql);
    }
    //创建包括数字和大写字母的随机字符
    public static function create_randchar($pw_length = 8)
    {
        $randpwd = '';
        for ($i = 0; $i < $pw_length; $i++) 
        {
            $h = mt_rand(0,1);
            if($h){
                $randpwd .= chr(mt_rand(48, 57));
            }else{
                $randpwd .= chr(mt_rand(65, 90));
            }
        }
        return $randpwd;
    }
    //创建随机数字
    public static function create_randnum($pw_length = 4)
    {
        $randpwd = '';
        for ($i = 0; $i < $pw_length; $i++) 
        {
              $randpwd .= chr(mt_rand(48, 57));
        }
        return $randpwd;
    }
    public static function encrypt_pwd($password){
		//TODO 暂时在后端进行加密，为前端未来加密传输预留
		$password = md5($password);
		return md5(crypt($password, substr($password, 0, 2)));
	}
    //UTF-8截取字符串
    public static function chinesesubstr($str, $start, $len) { // $str指字符串,$start指字符串的起始位置，$len指字符串长度
        $strlen = $start + $len; // 用$strlen存储字符串的总长度，即从字符串的起始位置到字符串的总长度
        $tmpstr="";
        for($i = $start; $i < $strlen;) {
            if (ord ( substr ( $str, $i, 1 ) ) > 0xa0) { // 如果字符串中首个字节的ASCII序数值大于0xa0,则表示汉字
                $tmpstr .= substr ( $str, $i, 3 ); // 每次取出三位字符赋给变量$tmpstr，即等于一个汉字
                $i=$i+3; // 变量自加3
            } else{
                $tmpstr .= substr ( $str, $i, 1 ); // 如果不是汉字，则每次取出一位字符赋给变量$tmpstr
                $i++;
            }
        }
        return $tmpstr; // 返回字符串
    }
    //注册获取验证码
    public static function MessageCode($number){
        $str1 = ord(substr(md5(substr(md5(substr($number,5)),10)),0,1));
        $str2 = ord(substr(md5(substr($number,0,5)),0,1));
        $str=$str1.$str2;
        return substr($str,0,4);
    }
    //返回头像地址
    public static function headpic($pic){
        if(!$pic) return '/images/head/0.jpg';
        else return $pic;
    }
    public static function login($id){
        $_SESSION['userid']=$id;
    }
}