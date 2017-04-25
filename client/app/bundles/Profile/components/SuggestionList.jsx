import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

class SuggestionList extends React.Component {

  render() {
    return (
      <div className="suggestion-list">
        {this.props.friends.map(function(friend, index) {
          return (<Friend name={friend} key={index}/>)
          }
        )}
      </div>
    );
  }
}

export default SuggestionList;