# �Ǘ��Ҍ����m�F
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administra ? 
tor")) {
    Start-Process powershe ? 
ll.exe "-Command", "& '$MyInvocation.MyCommand.Path' -Elevation"
    exit
}

# �R�s�[���̃t�H���_�p�X (�K�X�ύX)
$sourceFolder = "C:\Users\���[�U��\Documents\�R�s�[����t�H���_��"

# �R�s�[���USB�������[��SD�J�[�h�̃h���C�u���^�[ (�K�X�ύX)
$destinationDrive = "D:"

# �R�s�[��̃t�H���_��
$destinationFolder = "�R�s�[�����t�H���_�[��"

# �R�s�[��̃t���p�X
$destinationPath = Join-Path -Path $destinationDrive -ChildPath $destinationFolder

# �R�s�[��̃t�H���_�����݂��Ȃ��ꍇ�ɍ쐬
if (!(Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath
}

# �t�H���_���ċA�I�ɃR�s�[
Copy-Item -Path $sourceFolder -Destination $destinationPath -Recurse -Force