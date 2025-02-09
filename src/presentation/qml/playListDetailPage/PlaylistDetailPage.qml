import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style 1.0
import Belief.controllers 1.0
import CustomComponents
/*
    roles[IdRole] = "id";
    roles[AlRole] = "album";
    roles[ArRole] = "artists";
    roles[DtRole] = "duration";
*/
/*
    Q_PROPERTY(QString creatorName READ creatorName CONSTANT NOTIFY creatorNameChanged)
    Q_PROPERTY(QUrl creatorImgUrl READ creatorImgUrl NOTIFY creatorImgUrlChanged)
*/
WrapFlickable{
    id:root
    contentHeight:layout.implicitHeight
    property var dataSet: MusicController.albumDetail
    Rectangle{
        radius:10
        anchors.fill: parent
        color:"transparent"
        /*
        gradient:Gradient{
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#F8E5E4" }
            GradientStop { position: 0.5; color: "#FFFFFF" }
        }
        */
    }
    ColumnLayout{
        id:layout
        anchors.centerIn: parent
        width: parent.width/1.3
        height: parent.height-50
        RowLayout{
            Layout.preferredHeight: 195
            Layout.fillWidth: true
            spacing: 35

            RoundImage{
                id:coverImg
                source:root.dataSet.coverImgUrl
                Layout.preferredHeight: 168
                Layout.preferredWidth: 168
            }

            Column{
                id:column
                Layout.fillWidth: true
                spacing: 5
                Text{
                    id:name
                    text:root.dataSet.name
                    font.bold: true
                    font.pointSize: 16.5
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    width: column.width
                }

                Row{
                    RoundImage{
                        id:creatorCoverImg
                        source:root.dataSet.creatorImgUrl
                        width: 26
                        height: 26
                        radius:width/2
                    }
                    Text{
                        id:creatorName
                        text:root.dataSet.creatorName
                    }
                }

                Text{
                    id:desc
                    text:root.dataSet.desc
                    wrapMode: Text.WordWrap
                    elide:Text.ElideRight
                    width: column.width
                    height: 125
                }
            }
        }

        Rectangle{
            color:"transparent"
            width: parent.width
            height: 65
            RowLayout{
                anchors.fill: parent
                anchors.margins: 20
                Text{
                    text:"#"
                    font.bold: true
                    font.pointSize: 11
                }
                Text{
                    id:headerTitle
                    Layout.fillWidth: true
                    text:qsTr("标题")
                    font.bold: true
                    font.pointSize: 11
                }
                Text{
                    id:headerAlbum
                    text:qsTr("专辑")
                    Layout.fillWidth: true
                    font.bold: true
                    font.pointSize: 11
                }
                Text{
                    id:headerDuration
                    text:qsTr("播放时间")
                    font.bold: true
                    font.pointSize: 11
                }
            }
        }

        Repeater{
            id:repeater
            model:root.dataSet.songsModel
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            delegate:
                PlayListItem{
                    id:playListItem
                    index:model.index
                    width: layout.width
                    height: 90
                }
        }
    }
}
