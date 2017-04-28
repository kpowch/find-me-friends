import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

class SuggestionList extends React.Component {

  render() {
    return (
      <div className="suggestion-list">
        {this.props.friends.map(function(friend, index) {
          return (<Friend first_name={friend.first_name} last_name={friend.last_name} profile_picture={friend.profile_picture.thumb.url} email={friend.email} key={index}/>)
          }
        )}
      </div>
    );
  }
}

export default SuggestionList;