import React from 'react';
import ReactDOM from 'react-dom';

export default class PendingFriend extends React.Component {

  render() {
    // this makes the code more readable
    const { currentUser, friend, acceptPendingFriend, declinePendingFriend } = this.props;

    // TODO this should be refactored as the only difference is the accept button
    if (currentUser.id !== friend.friendship.friend_id) {
      return (
        <div className='friend'>
          <div className='name-container'>
            <div className='card-name-container'>
              <img className='card-pic' src={friend.profile_picture}/>
              <div className='name-email'>
                <div className='card-name'>
<<<<<<< HEAD
                  {friend.first_name + ' ' + friend.last_name}
=======
                  {friend.first_name} {friend.last_name}<br/>
>>>>>>> 7b9e2380b613d2978edff8ff1f8f8d037cdfb3ee
                </div>
                <div className='card-email'>
                {friend.email}<br/><br/>
                </div>
              </div>
            </div>
            <div className='card-bio'>
               {friend.bio}<br/>
            </div>
          </div>

          <div className='profile-column'>
            <p>This friendship is awaiting a response.</p><br/>
            <div className='skip-friend'>
              <a className='button' onClick={declinePendingFriend(friend)}>Remove Pending</a><br/>
            </div>
          </div>
          <div className='card-percent'>
            {friend.friendship_match}
          </div>
        </div>
      );
    } else {
      return (
        <div className='friend'>
          <div className='name-container'>
            <div className='card-name-container'>
              <img className='card-pic' src={friend.profile_picture}/>
              <div className='name-email'>
                <div className='card-name'>
<<<<<<< HEAD
                  {friend.first_name + ' ' + friend.last_name}
=======
                  {friend.first_name} {friend.last_name}<br/>
>>>>>>> 7b9e2380b613d2978edff8ff1f8f8d037cdfb3ee
                </div>
                <div className='card-email'>
                {friend.email}<br/><br/>
                </div>
              </div>
            </div>
            <div className='card-bio'>
               {friend.bio}<br/>
            </div>
          </div>
          <div className='profile-column'>
            <div className='friend-buttons'>
              <div className='add-friend'>
                <a className='form-button' onClick={acceptPendingFriend(friend)}>Accept</a><br/><br/>
              </div>
              <div className='skip-friend'>
                <a className='remove-filter' onClick={declinePendingFriend(friend)}>Decline >></a><br/>
              </div>
            </div>
          </div>
          <div className='card-percent'>
            {friend.friendship_match}
          </div>
        </div>
      );
    }
  }
}
