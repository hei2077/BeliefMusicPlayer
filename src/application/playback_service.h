#ifndef PLAYBACKSERVICE_H
#define PLAYBACKSERVICE_H

#include <QMediaPlayer>
#include <QAudioOutput>

#include "i_playback_service.h"
#include "song.h"

namespace application{
class PlaybackService : public IPlaybackService
{
    Q_OBJECT
public:
    explicit PlaybackService();
    virtual float volume() const override;
    virtual void setPlaybackList(QVector<domain::Song>*) override;
    virtual void setPlaybackMode(PlaybackMode) override;
public slots:
    void setVolume(float volume) override;
    virtual void playNewSong() override;
private:
    int shuffleNextSongIndex();
    void playNextSong();
private:
    int m_playbackCurrentIndex;
    PlaybackMode m_playbackMode;
    QAudioOutput m_audioOutput;
    QVector<domain::Song> *m_playBackList; // 播放列表
};
}
#endif // PLAYBACKSERVICE_H
