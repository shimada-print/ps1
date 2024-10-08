# 環境設定について
## インストール直後にはパスを環境変数に通さないとコマンドが認識しない
WIndwosのインストーラーでインストールする時に、実行書類などがある場所にパスを通す項目もありますが、例えばpython.exeの別バージョンを共存する時には、別の場所にインストールしますので、普段パワーシェルのターミナルで使用したいパスを選ぶことになります。  

また最近はWindowsOSなどでも配布が減っていますが、インストーラーではなくZIP書類（WindowsOSの場合はISO書類）で配布されているコンパイラーなどの実行プログラム書類は、別バージョンを共存などを細かくできますが、パスは自分で通すことになります。こっちの方がインストーラーよりも安全そうです。そこで操作を簡略化するために以下のようなスクリプトを作りました。
### env-path_set.ps1 はシステムのプロパティを表示するパワーシェルスクリプト
env-path_set.ps1はPythonやGo言語などをインストールした直後に、WindowsOSの環境設定でパスが通っていなので、コマンド「python env」や「go env」などでインストールできたか（環境設定を表示）？を確認できないのをできるようにするために、設定画面を呼び出すためのスクリプトです。  

この画面を表示するためにはネストが深すぎて、毎回探すのが面倒だったので、こういうスクリプトを作りました。しかしシステムのプロパティのコンピューターの名前タブまでは出ますが、その後の詳細タブの環境変数ボタンを押した後の環境変数を設定する画面までは、OSの仕様で出ません。  

ただしレジストリをいじれば設定できるようですが、これをするのは危険なのでしません。しかもパスを通す設定が多い訳でもなく、Bunのようにデフォルトで通っている場合もあります。ただしバージョン確認コマンドよりも環境変数コマンドの方が、開発プロジェクトに新規参入者などが便利に使えると思います。
