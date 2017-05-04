import React from 'react';
import ReactDOM from 'react-dom';
import InterestMatchChart from './InterestMatchChart';

export default class PendingFriend extends React.Component {

  render() {
    // this makes the code more readable
    const { currentUser, friend, acceptPendingFriend, declinePendingFriend } = this.props;

    return (
      <div className='friend'>
        <div className='name-container'>
          <div className='card-name-container'>
            <img className='card-pic' src={friend.profile_picture}/>
            <div className='name-email'>
              <div className='card-name'>
                {friend.first_name + ' ' + friend.last_name}
              </div>
              <div className='card-email'>
                {friend.email}
              </div>
            </div>
          </div>
          <div className='card-bio'>
             {friend.bio}
          </div>
        </div>

        <div className='profile-column'>
          <div className='card-percent'>
            <InterestMatchChart match={Math.round(friend.friendship_match * 100)} />
          </div>
          <div className='friend-buttons'>
          {currentUser.id !== friend.friendship.friend_id && (
            <div>
              <div className='awaiting-response'>Pending friendship awaiting response.</div>
              <div className='skip-friend'>
                <a className='button' onClick={declinePendingFriend(friend)}>Remove Pending >></a>
              </div>
            </div>
          )}
          {currentUser.id === friend.friendship.friend_id && (
            <div>
              <div className='add-friend'>
                <a className='form-button' onClick={acceptPendingFriend(friend)}>Accept</a>
              </div>
              <div className='skip-friend'>
                <a className='button' onClick={declinePendingFriend(friend)}>Decline >></a>
              </div>
            </div>
          )}
        </div>
        </div>
      </div>
    );
  }
}
