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
              <div className='pending-name-email'>
                <div className='card-name'>
                  {friend.first_name} {friend.last_name}
                </div>
                <div className='card-email'>
                  {friend.email}<br/><br/>
                </div>
              </div>
            </div>
          </div>
          <div className='profile-column'>
            <p>This friendship is awaiting a response.</p><br/>
            <div className='skip-friend'>
              <a className='button' onClick={declinePendingFriend(friend)}>Remove Pending</a><br/>
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <div className='friend'>
          <a className='remove-filter' onClick={acceptPendingFriend(friend)}>Accept</a><br/>
          <a className='remove-filter' onClick={declinePendingFriend(friend)}>Decline</a><br/>
          <div className='card-name'>
            {friend.first_name}
          </div>
          <div className='card-name'>
            {friend.last_name}
          </div>
          <img className='card-pic' src={friend.profile_picture}/>
          <div className='card-email'>
            {friend.email}
          </div>
        </div>
      );
    }
  }
}
