unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, EditBtn, FileCtrl, maskedit, Process;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckAll: TCheckBox;
    CheckNot: TCheckBox;
    CheckLeft: TCheckBox;
    CheckRight: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    FileListBox1: TFileListBox;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckAllChange(Sender: TObject);
    procedure CheckLeftChange(Sender: TObject);
    procedure CheckNotChange(Sender: TObject);
    procedure CheckRightChange(Sender: TObject);
    procedure CheckRightClick(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { private declarations }
    st1,st2:TStringlist;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poUsePipes, poStderrToOutPut];
    sd.CommandLine := 'sudo';
    sd.Execute;
    sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := form1.Edit19.Text + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := form1.Edit18.Text;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function pross2(set_name,dir:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    ps := form1.Edit18.Text;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' +  dir + '\' + ExtractFileName( set_name ) + ' ' + set_name);
    sv.Execute;
    sv.Free;
end;

function prossbck(set_name,dir:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    ps := form1.Edit18.Text;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' +  set_name + ' ' + dir + '\' + ExtractFileName( set_name )  );
    sv.Execute;
    sv.Free;
end;

function pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    ps := form1.Edit18.Text;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S ' + command );
    sv.Execute;
    sv.Free;
end;



function cpy(dir:string):boolean;
begin
  if form1.CheckBox1.Checked then begin
    pross2(form1.Edit1.Text,dir);
  end;
  if form1.CheckBox2 .Checked then begin
    pross2(form1.Edit2.Text,dir);
  end;
  if form1.CheckBox3 .Checked then begin
    pross2(form1.Edit3.Text,dir);
  end;
  if form1.CheckBox4 .Checked then begin
    pross2(form1.Edit4.Text,dir);
  end;
  if form1.CheckBox5 .Checked then begin
    pross2(form1.Edit5.Text,dir);
  end;
  if form1.CheckBox6 .Checked then begin
    pross2(form1.Edit6.Text,dir);
  end;
  if form1.CheckBox7 .Checked then begin
    pross2(form1.Edit7.Text,dir);
  end;
  if form1.CheckBox8 .Checked then begin
    pross2(form1.Edit8.Text,dir);
  end;
  if form1.CheckBox9 .Checked then begin
    pross2(form1.Edit9.Text,dir);
  end;
  if form1.CheckBox10 .Checked then begin
    pross2(form1.Edit10.Text,dir);
  end;
  if form1.CheckBox11 .Checked then begin
    pross2(form1.Edit11.Text,dir);
  end;
  if form1.CheckBox12 .Checked then begin
    pross2(form1.Edit12.Text,dir);
  end;
  if form1.CheckBox13 .Checked then begin
    pross2(form1.Edit13.Text,dir);
  end;
  if form1.CheckBox14 .Checked then begin
    pross2(form1.Edit14.Text,dir);
  end;

end;


function cpy2(dir:string):boolean;
begin
  if form1.CheckBox1.Checked then begin
    prossbck(form1.Edit1.Text,dir);
  end;
  if form1.CheckBox2 .Checked then begin
    prossbck(form1.Edit2.Text,dir);
  end;
  if form1.CheckBox3 .Checked then begin
    prossbck(form1.Edit3.Text,dir);
  end;
  if form1.CheckBox4 .Checked then begin
    prossbck(form1.Edit4.Text,dir);
  end;
  if form1.CheckBox5 .Checked then begin
    prossbck(form1.Edit5.Text,dir);
  end;
  if form1.CheckBox6 .Checked then begin
    prossbck(form1.Edit6.Text,dir);
  end;
  if form1.CheckBox7 .Checked then begin
    prossbck(form1.Edit7.Text,dir);
  end;
  if form1.CheckBox8 .Checked then begin
    prossbck(form1.Edit8.Text,dir);
  end;
  if form1.CheckBox9 .Checked then begin
    prossbck(form1.Edit9.Text,dir);
  end;
  if form1.CheckBox10 .Checked then begin
    prossbck(form1.Edit10.Text,dir);
  end;
  if form1.CheckBox11 .Checked then begin
    prossbck(form1.Edit11.Text,dir);
  end;
  if form1.CheckBox12 .Checked then begin
    prossbck(form1.Edit12.Text,dir);
  end;
  if form1.CheckBox13 .Checked then begin
    prossbck(form1.Edit13.Text,dir);
  end;
  if form1.CheckBox14 .Checked then begin
    prossbck(form1.Edit14.Text,dir);
  end;

end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.CheckRightClick(Sender: TObject);
begin

end;

procedure TForm1.FileListBox1DblClick(Sender: TObject);
var
  s:string;
begin
  s := form1.FileListBox1.Items[form1.FileListBox1.ItemIndex];
  s[1] := '/';
  s[length(s)] := '/';

  try
    st1.LoadFromFile( ExtractFileDir(Paramstr(0)) + s + 'copy' );
  except
    exit;
  end;
  try
    //st2.LoadFromFile(ExtractFilePath( Paramstr(0)) + 'backup' );
  except
  end;
  //showmessage(st1.Text);
  try
  form1.Edit1.Text:= st1[0];
  except
  end;try
  form1.Edit2.Text:= st1[1];
  except
  end;try
  form1.Edit3.Text:= st1[2];
  except
  end;try
  form1.Edit4.Text:= st1[3];
  except
  end;try
  form1.Edit5.Text:= st1[4];
  except
  end;try
  form1.Edit6.Text:= st1[5];
  except
  end;try
  form1.Edit7.Text:= st1[6];
  except
  end;try
  form1.Edit8.Text:= st1[7];
  except
  end;try
  form1.Edit9.Text:= st1[8];
  except
  end;try
  form1.Edit10.text:= st1[9];
  except
  end;try
  form1.Edit11.Text:= st1[10];
  except
  end;try
  form1.Edit12.Text:= st1[11];
  except
  end;try
  form1.Edit13.Text:= st1[12];
  except
  end;try
  form1.Edit14.Text:= st1[13];
  except
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  st1.Free;
  st2.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  st1 := TStringlist.Create;
  st2 := TStringlist.Create;
  st1.Clear;
  st2.Clear;

  form1.FileListBox1.Directory:= ExtractFilePath(Paramstr(0));
end;

procedure TForm1.CheckLeftChange(Sender: TObject);
begin
   if  form1.CheckLeft.Checked then begin
    form1.CheckBox9.Checked:= true;
    form1.CheckBox10.Checked:= true;
    form1.CheckBox11.Checked:= true;
    form1.CheckBox12.Checked:= true;
    form1.CheckBox13.Checked:= true;
    form1.CheckBox14.Checked:= true;
    form1.CheckBox15.Checked:= true;
    form1.CheckBox16.Checked:= true;
  end;
  if not form1.CheckLeft.Checked then begin
    form1.CheckBox9.Checked:= not true;
    form1.CheckBox10.Checked:= not true;
    form1.CheckBox11.Checked:= not true;
    form1.CheckBox12.Checked:= not true;
    form1.CheckBox13.Checked:= not true;
    form1.CheckBox14.Checked:= not true;
    form1.CheckBox15.Checked:= not true;
    form1.CheckBox16.Checked:= not true;
  end;
end;

procedure TForm1.CheckNotChange(Sender: TObject);
begin
    form1.CheckBox1.Checked:= not form1.CheckBox1.Checked;
    form1.CheckBox3.Checked:= not form1.CheckBox3.Checked;
    form1.CheckBox4.Checked:= not form1.CheckBox4.Checked;
    form1.CheckBox5.Checked:= not form1.CheckBox5.Checked;
    form1.CheckBox6.Checked:= not form1.CheckBox6.Checked;
    form1.CheckBox7.Checked:= not form1.CheckBox7.Checked;
    form1.CheckBox8.Checked:= not form1.CheckBox8.Checked;
    form1.CheckBox9.Checked:= not form1.CheckBox9.Checked;
    form1.CheckBox10.Checked:= not form1.CheckBox10.Checked;
    form1.CheckBox11.Checked:= not form1.CheckBox11.Checked;
    form1.CheckBox12.Checked:= not form1.CheckBox12.Checked;
    form1.CheckBox13.Checked:= not form1.CheckBox13.Checked;
    form1.CheckBox14.Checked:= not form1.CheckBox14.Checked;
    form1.CheckBox15.Checked:= not form1.CheckBox15.Checked;
    form1.CheckBox16.Checked:= not form1.CheckBox16.Checked;
end;

procedure TForm1.CheckAllChange(Sender: TObject);
begin
  if form1.Checkall.Checked then begin
    form1.CheckBox1.Checked:= true;
    form1.CheckBox3.Checked:= true;
    form1.CheckBox4.Checked:= true;
    form1.CheckBox5.Checked:= true;
    form1.CheckBox6.Checked:= true;
    form1.CheckBox7.Checked:= true;
    form1.CheckBox8.Checked:= true;
    form1.CheckBox9.Checked:= true;
    form1.CheckBox10.Checked:= true;
    form1.CheckBox11.Checked:= true;
    form1.CheckBox12.Checked:= true;
    form1.CheckBox13.Checked:= true;
    form1.CheckBox14.Checked:= true;
    form1.CheckBox15.Checked:= true;
    form1.CheckBox16.Checked:= true;
  end;
  if not form1.Checkall.Checked then begin
    form1.CheckBox1.Checked:= not true;
    form1.CheckBox3.Checked:= not true;
    form1.CheckBox4.Checked:= not true;
    form1.CheckBox5.Checked:= not true;
    form1.CheckBox6.Checked:= not true;
    form1.CheckBox7.Checked:= not true;
    form1.CheckBox8.Checked:= not true;
    form1.CheckBox9.Checked:= not true;
    form1.CheckBox10.Checked:= not true;
    form1.CheckBox11.Checked:= not true;
    form1.CheckBox12.Checked:= not true;
    form1.CheckBox13.Checked:= not true;
    form1.CheckBox14.Checked:= not true;
    form1.CheckBox15.Checked:= not true;
    form1.CheckBox16.Checked:= not true;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if form1.CheckBox1.Checked then begin
    pross(form1.Edit1.Text,'set_temp1.txt');
  end;
  if form1.CheckBox2 .Checked then begin
    pross(form1.Edit2.Text,'set_temp2.txt');
  end;
  if form1.CheckBox3 .Checked then begin
    pross(form1.Edit3.Text,'set_temp3.txt');
  end;
  if form1.CheckBox4 .Checked then begin
    pross(form1.Edit4.Text,'set_temp4.txt');
  end;
  if form1.CheckBox5 .Checked then begin
    pross(form1.Edit5.Text,'set_temp5.txt');
  end;
  if form1.CheckBox6 .Checked then begin
    pross(form1.Edit6.Text,'set_temp6.txt');
  end;
  if form1.CheckBox7 .Checked then begin
    pross(form1.Edit7.Text,'set_temp7.txt');
  end;
  if form1.CheckBox8 .Checked then begin
    pross(form1.Edit8.Text,'set_temp8.txt');
  end;
  if form1.CheckBox9 .Checked then begin
    pross(form1.Edit9.Text,'set_temp9.txt');
  end;
  if form1.CheckBox10 .Checked then begin
    pross(form1.Edit10.Text,'set_temp10.txt');
  end;
  if form1.CheckBox11 .Checked then begin
    pross(form1.Edit11.Text,'set_temp11.txt');
  end;
  if form1.CheckBox12 .Checked then begin
    pross(form1.Edit12.Text,'set_temp12.txt');
  end;
  if form1.CheckBox13 .Checked then begin
    pross(form1.Edit13.Text,'set_temp13.txt');
  end;
  if form1.CheckBox14 .Checked then begin
    pross(form1.Edit14.Text,'set_temp14.txt');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  s:string;
begin
  s := form1.FileListBox1.Items[form1.FileListBox1.ItemIndex];
  s[1] := '/';
  s[length(s)] := '/';
  //showmessage(ExtractFileDir(Paramstr(0)) + s);
  cpy(ExtractFileDir(Paramstr(0)) + s);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  form1.FileListBox1.Directory:= Paramstr(0);

  pross3(' mkdir ' + ExtractFilePath(Paramstr(0)) + form1.Edit17.Text + '.prj');

  form1.FileListBox1.Directory:= ExtractFilePath(Paramstr(0));
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  s:string;
begin
  s := form1.FileListBox1.Items[form1.FileListBox1.ItemIndex];
  s[1] := '/';
  s[length(s)] := '/';
  //showmessage(s);
  form1.FileListBox1.Directory:= Paramstr(0);

  pross3(' rm -f -r ' + ExtractFileDir(Paramstr(0)) + s);

  form1.FileListBox1.Directory:= ExtractFilePath(Paramstr(0));
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  form1.FileListBox1.Directory:= Paramstr(0);
  form1.FileListBox1.Directory:= ExtractFilePath(Paramstr(0));
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  s:string;
begin
  s := form1.FileListBox1.Items[form1.FileListBox1.ItemIndex];
  s[1] := '/';
  s[length(s)] := '/';

  st1.Clear;
  st1.Add(form1.Edit1.Text);
  st1.Add(form1.Edit2.Text);
  st1.Add(form1.Edit3.Text);
  st1.Add(form1.Edit4.Text);
  st1.Add(form1.Edit5.Text);
  st1.Add(form1.Edit6.Text);
  st1.Add(form1.Edit7.Text);
  st1.Add(form1.Edit8.Text);
  st1.Add(form1.Edit9.Text);
  st1.Add(form1.Edit10.Text);
  st1.Add(form1.Edit11.Text);
  st1.Add(form1.Edit12.Text);
  st1.Add(form1.Edit13.Text);
  st1.Add(form1.Edit14.Text);

  try
    st1.SaveToFile( ExtractFilePath(Paramstr(0)) + 'copy' );
    pross3('cp -f ' + ExtractFilePath(Paramstr(0)) + 'copy ' + ExtractFileDir(Paramstr(0)) + s + 'copy');
  except
  end;
  try
    //st2.SaveToFile( ExtractFilePath( Paramstr(0))  + 'backup' );
  except
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  s:string;
begin
  s := form1.FileListBox1.Items[form1.FileListBox1.ItemIndex];
  s[1] := '/';
  s[length(s)] := '/';
  //showmessage(ExtractFileDir(Paramstr(0)) + s);
  cpy2(ExtractFileDir(Paramstr(0)) + s);

end;

procedure TForm1.CheckRightChange(Sender: TObject);
begin
  if  form1.CheckRight.Checked then begin
    form1.CheckBox1.Checked:= true;
    form1.CheckBox3.Checked:= true;
    form1.CheckBox4.Checked:= true;
    form1.CheckBox5.Checked:= true;
    form1.CheckBox6.Checked:= true;
    form1.CheckBox7.Checked:= true;
    form1.CheckBox8.Checked:= true;
  end;
  if not form1.CheckRight.Checked then begin
    form1.CheckBox1.Checked:= not true;
    form1.CheckBox3.Checked:= not true;
    form1.CheckBox4.Checked:= not true;
    form1.CheckBox5.Checked:= not true;
    form1.CheckBox6.Checked:= not true;
    form1.CheckBox7.Checked:= not true;
    form1.CheckBox8.Checked:= not true;
  end;
end;

end.

